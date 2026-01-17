//
//  BudgetWidget.swift
//  BudgetWidget
//
//  Created by Budget Pro AI on 16/01/26.
//

import WidgetKit
import SwiftUI

// ROBUST DATA MODEL: All fields optional to prevent decoding crashes
struct BudgetData: Codable {
    let expense: Double?
    let income: Double?
    let budget: Double?
    let month: String?
}

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), data: BudgetData(expense: 15000, income: 45000, budget: 50000, month: "Jan"))
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), data: BudgetData(expense: 12450, income: 60000, budget: 30000, month: "Jan"))
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        let userDefaults = UserDefaults(suiteName: "group.com.budgetpro.data")
        let jsonString = userDefaults?.string(forKey: "widgetData")
        
        // Default safe values
        var budgetData = BudgetData(expense: 0, income: 0, budget: 0, month: "")
        
        if let json = jsonString {
            // Debug: Print raw JSON to console (visible in Console.app)
            print("Widget Raw JSON: \(json)")
            
            if let data = json.data(using: .utf8) {
                if let decoded = try? JSONDecoder().decode(BudgetData.self, from: data) {
                    budgetData = decoded
                } else {
                    print("Widget Decoding Failed!")
                }
            }
        }
        
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, data: budgetData)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let data: BudgetData
}

struct BudgetWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family
    @Environment(\.colorScheme) var colorScheme

    // Safe Accessors
    var safeExpense: Double { entry.data.expense ?? 0 }
    var safeIncome: Double { entry.data.income ?? 0 }
    var safeBudget: Double { entry.data.budget ?? 0 }
    var safeMonth: String { entry.data.month ?? "" }

    var body: some View {
        ZStack {
            // Background
            if family == .systemMedium {
                ZStack {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "indianrupeesign.circle.fill")
                                .font(.system(size: 90))
                                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255).opacity(0.03))
                                .rotationEffect(.degrees(15))
                                .offset(x: 20, y: -20)
                        }
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Image(systemName: "bitcoinsign.circle.fill")
                                .font(.system(size: 60))
                                .foregroundColor(Color(red: 255/255, green: 255/255, blue: 255/255).opacity(0.02))
                                .rotationEffect(.degrees(-15))
                                .offset(x: -20, y: 20)
                            Spacer()
                        }
                    }
                }
            }
            
            VStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    Text("Budget Pro")
                        .font(.system(size: 16, weight: .black, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(red: 56/255, green: 189/255, blue: 248/255), // Sky-400
                                    Color(red: 52/255, green: 211/255, blue: 153/255)  // Emerald-400
                                ],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    Spacer()
                }
                .padding(.bottom, family == .systemSmall ? 0 : 8)
                
                HStack(alignment: .center, spacing: 10) {
                    // Chart
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.08), lineWidth: family == .systemSmall ? 12 : 8)
                        
                        // Progress Logic
                        Circle()
                            .trim(from: 0, to: safeBudget > 0 ? CGFloat(min(1.0, safeExpense / safeBudget)) : 0.001)
                            .stroke(
                                LinearGradient(gradient: Gradient(colors: [
                                    Color(red: 239/255, green: 68/255, blue: 68/255), // Red-500
                                    Color(red: 248/255, green: 113/255, blue: 113/255) // Red-400
                                ]), startPoint: .top, endPoint: .bottom),
                                style: StrokeStyle(lineWidth: family == .systemSmall ? 12 : 8, lineCap: .round)
                            )
                            .rotationEffect(.degrees(-90))
                    }
                    .frame(width: family == .systemSmall ? 60 : 60, height: family == .systemSmall ? 60 : 60)
                    
                    // Stats
                    if family == .systemMedium {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Total Expense")
                                .font(.system(size: 11, weight: .semibold))
                                .foregroundColor(.gray)
                                .fixedSize(horizontal: false, vertical: true)
                            
                            Text("₹\(Int(safeExpense))")
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .minimumScaleFactor(0.8)
                            
                            if !safeMonth.isEmpty {
                                Text(safeMonth)
                                    .font(.system(size: 9, weight: .semibold))
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 3)
                                    .background(Color.white.opacity(0.08))
                                    .cornerRadius(4)
                                    .foregroundColor(Color(red: 148/255, green: 163/255, blue: 184/255))
                            }
                        }
                    }
                    Spacer()
                }
                
                Spacer()
                
                // Add Button
                Link(destination: URL(string: "budgetpro://add")!) {
                    ZStack {
                        Capsule()
                            .fill(LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 56/255, green: 189/255, blue: 248/255),
                                    Color(red: 52/255, green: 211/255, blue: 153/255)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing
                            ))
                            .frame(height: 38)
                        
                        HStack(spacing: 6) {
                            Image(systemName: "plus")
                                .font(.system(size: 14, weight: .heavy))
                            Text("Add Expense")
                                .font(.system(size: 13, weight: .bold))
                        }
                        .foregroundStyle(Color.black)
                        .environment(\.colorScheme, .light)
                    }
                }
            }
        }
        .padding(14)
        .containerBackground(for: .widget) {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 2/255, green: 6/255, blue: 23/255),
                    Color(red: 15/255, green: 23/255, blue: 42/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        }
        .widgetURL(URL(string: "budgetpro://add"))
    }
}

@main
struct BudgetWidget: Widget {
    let kind: String = "BudgetWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            BudgetWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Budget Pro Widget")
        .description("Quickly add expenses from your home screen.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct BudgetWidget_Previews: PreviewProvider {
    static var previews: some View {
        BudgetWidgetEntryView(entry: SimpleEntry(date: Date(), data: BudgetData(expense: 12000, income: 50000, budget: 30000, month: "Jan")))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
