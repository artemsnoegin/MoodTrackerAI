//
//  MockRepository.swift
//  MoodTracker
//
//  Created by Артём Сноегин on 29.01.2026.
//

import Foundation

enum MockRepositoryType {
    /// Стабильный, осознанный, немного тревожный, есть дисциплина, рефлексия, редкие провалы.
    case stableRU
    /// Эмоциональные качели, импульсивность, самокритика ,яркие пики, резкие падения, сильная рефлексия.
    case impulsiveRU
    /// Выгорание, перегруз, работа сменами, восстановление, много усталости, пустота, затем постепенный подъём.
    case burnoutRU
    /// Sarcastic, tired of everything, but sharp.
    case cynicalEN
    /// Sensitive, poetic, meaning-seeking.
    case romanticEN
    /// Self-tracking, patterns, structured reflection.
    case analyticalEN
}

class MockRepository {
    
    let type: MockRepositoryType
    
    init(type: MockRepositoryType) {
        self.type = type
    }
    
    private var stableRU: Set<Report> = [
        Report(
            date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
            score: .okay,
            userDescription: "Нормальный день, но внутри будто фоновая тревога. Работал без особого вдохновения. Вечером немного отпустило."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
            score: .good,
            userDescription: "Сегодня получилось держать темп. Не распылялся, сделал важное. Было ощущение контроля."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -11, to: Date())!,
            score: .fair,
            userDescription: "С утра всё раздражало, даже мелочи. В голове крутилось много мыслей. Понял, что я устал."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
            score: .okay,
            userDescription: "Всё очень хорошо!"
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
            score: .okay,
            userDescription: "Середина недели, просто держусь. Не плохо и не хорошо. Спасли музыка и прогулка."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
            score: .good,
            userDescription: "Чувствовал себя бодро, даже хотелось общаться. В работе было больше ясности. Поймал маленькую радость от простых вещей."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            score: .okay,
            userDescription: "Немного пустовато внутри. День прошёл ровно. Старался не требовать от себя слишком много."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            score: .okay,
            userDescription: "Очень хороший день. Было ощущение, что я на своём месте. Прям захотелось планировать будущее."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
            score: .okay,
            userDescription: "Всё хорошо."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            score: .good,
            userDescription: "Всё шло спокойно и понятно. Не было лишних эмоций. Понравилось это ощущение устойчивости."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            score: .fair,
            userDescription: "Сорвался на раздражение. Потом было стыдно, хотя ничего ужасного не случилось. Хочу научиться мягче реагировать."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            score: .okay,
            userDescription: "Норм. Внутри чуть-чуть напряжение, но я справляюсь. Вечером просто выключился."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            score: .good,
            userDescription: "Сегодня я себе понравился. Делал то, что важно, и не гнал себя. Хороший баланс."
        ),
        Report(
            date: Date(),
            score: .okay,
            userDescription: "Есть ощущение усталости. Но это не провал, а просто сигнал. Хочу завтра дать себе больше воздуха."
        )
    ]
    
    private var impulsiveRU: Set<Report> = [
        Report(
            date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
            score: .great,
            userDescription: "Я проснулся и сразу понял: день мой. Всё получалось, как будто кто-то убрал сопротивление мира. Было много энергии."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
            score: .good,
            userDescription: "Неплохо, но чуть-чуть уже откат. Много думал о будущем и ловил себя на тревоге. Всё равно держался."
        ),
        // пропуск -11
        Report(
            date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
            score: .bad,
            userDescription: "Провальный день. Ничего не хотелось, всё раздражало. Я будто потерял опору и просто пережидал."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
            score: .fair,
            userDescription: "С утра было тяжело, но к вечеру отпустило. Понял, что мне нужна структура. Без неё я распадаюсь."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
            score: .good,
            userDescription: "Собрался. Сделал пару важных вещей и почувствовал уважение к себе. Это было приятно."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            score: .great,
            userDescription: "Супер день. Был поток, музыка звучала правильно, мысли ясные. Такое хочется запоминать."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            score: .fair,
            userDescription: "Резкий спад. Как будто вчерашняя энергия взяла и закончилась. Я слишком много от себя хотел."
        ),
        // пропуск -5
        Report(
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            score: .okay,
            userDescription: "День без эмоций. И это даже неплохо. Просто сделал бытовое и не анализировал."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            score: .bad,
            userDescription: "Снова накрыло. Много самокритики, прям жестко. Хочется спрятаться и никого не видеть."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            score: .okay,
            userDescription: "Понемногу вылезаю. Я не сломан — просто у меня такой период. Важно помнить это."
        ),
        // пропуск - 1
        Report(
            date: Date(),
            score: .fair,
            userDescription: "День не ужасный, но нервный. Слишком много внутренних качелей. Хочу завтра быть бережнее к себе."
        )
    ]
    
    private var burnoutRU: Set<Report> = [
        Report(
            date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
            score: .fair,
            userDescription: "Усталость накопилась. Работал на автомате. Вечером не было сил даже думать."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
            score: .bad,
            userDescription: "Очень тяжело. Всё бесит, а потом приходит пустота. Я будто выжатый."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -11, to: Date())!,
            score: .bad,
            userDescription: "Поймал ощущение бессмысленности. Не драматично, но липко. Хочу просто исчезнуть на день."
        ),
        // пропуск -10
        Report(
            date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
            score: .fair,
            userDescription: "Чуть лучше. Старался делать всё медленнее. Вроде стало меньше внутреннего шума."
        ),
        // пропуск -8
        Report(
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            score: .okay,
            userDescription: "Стал лучше спать. Из-за этого появилось ощущение, что я снова живой. Всё ещё осторожно."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            score: .good,
            userDescription: "Появилось желание что-то планировать. Сделал маленький шаг в сторону своих целей. Это дало силы."
        ),
        // пропуск -5
        Report(
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            score: .good,
            userDescription: "Было много спокойствия. Я не торопился и не давил на себя. Понял, как сильно мне нужна тишина."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            score: .okay,
            userDescription: "Немного тревоги вернулось, но уже без паники. Я отследил триггер. Это приятно — чувствовать контроль."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            score: .good,
            userDescription: "Сегодня я прям молодец. Не геройствовал, но сделал важное. И не обесценил."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            score: .great,
            userDescription: "Очень тёплый день. Было ощущение любви к жизни. Хочется удержать это состояние и не спешить."
        ),
        Report(
            date: Date(),
            score: .good,
            userDescription: "Я всё ещё устаю, но внутри больше света. Кажется, я постепенно возвращаюсь. И это главное."
        )
    ]
    
    private var cynicalEN: Set<Report> = [
        Report(
            date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
            score: .fair,
            userDescription: "Woke up already annoyed. People move through life like NPCs and somehow I’m the one expected to smile. I did what I had to do."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
            score: .okay,
            userDescription: "Nothing terrible happened, which is apparently a win. Work was noise. I’m tired of pretending it matters."
        ),
        // skip -11
        Report(
            date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
            score: .bad,
            userDescription: "Low energy, low patience. Everything felt like an obligation. I’d like to unsubscribe from reality for a day."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
            score: .fair,
            userDescription: "Slightly less miserable. Still not inspired by the idea of being productive for the rest of my life. At least coffee did its job."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
            score: .okay,
            userDescription: "I functioned. That’s the headline. No emotional fireworks, just survival mode with better posture."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            score: .good,
            userDescription: "Unexpectedly decent day. I got things done without hating everyone. Rare but appreciated."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            score: .great,
            userDescription: "Great day. No big disappointments. I’ll take that kind of peace."
        ),
        // skip -5
        Report(
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            score: .great,
            userDescription: "Another decent day! I was by myself nothing could't change it."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            score: .bad,
            userDescription: "Mood dropped again. It’s funny how fast motivation dies when you remember the world is built on nonsense"
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            score: .bad,
            userDescription: "I snapped at someone. Not proud, not shocked. I’m exhausted and my social battery is basically a rumor."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            score: .bad,
            userDescription: "I'm too tired for this..."
        ),
    ]
    
    private var romanticEN: Set<Report> = [
        Report(
            date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
            score: .good,
            userDescription: "The morning felt soft and quiet. I noticed the light on the walls and it made me feel strangely safe. I want more days like this."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
            score: .great,
            userDescription: "My heart felt open today. I felt connected to people, even in small interactions. It’s like life whispered: you’re allowed to be happy."
        ),
        // skip -11
        Report(
            date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
            score: .okay,
            userDescription: "A quieter day. I felt a little lonely, but not in a tragic way — more like a gentle ache. I tried to treat myself kindly."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
            score: .fair,
            userDescription: "I felt fragile. Everything seemed louder than it needed to be. I wanted to disappear into music and let it hold me."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
            score: .good,
            userDescription: "I felt warmth again. I caught myself smiling for no reason. It reminded me that the world still contains tenderness."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            score: .great,
            userDescription: "A beautiful day. I felt inspired, like I could create something honest. I wish I could bottle this feeling and drink it slowly later."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            score: .okay,
            userDescription: "I slowed down today. Not everything needs to be achieved. Sometimes it’s enough to simply exist and breathe."
        ),
        // skip -5
        Report(
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            score: .fair,
            userDescription: "My mood dipped. I felt misunderstood, even though no one really did anything wrong. I think my heart just needed rest."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            score: .good,
            userDescription: "I’m learning to be gentle with myself. I did small things, slowly. It wasn’t magical, but it was real."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            score: .great,
            userDescription: "I felt grateful today. I noticed how much love exists in ordinary moments. Even the air felt kinder."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            score: .great,
            userDescription: "My soul felt awake. I wanted to dream bigger. I felt like the future could be something beautiful, not just something to endure."
        ),
        Report(
            date: Date(),
            score: .great,
            userDescription: "Today was peaceful. I’m not rushing. I’m letting life arrive at its own pace."
        )
    ]
    
    private var analyticalEN: Set<Report> = [
        Report(
            date: Calendar.current.date(byAdding: .day, value: -13, to: Date())!,
            score: .okay,
            userDescription: "Overall stable mood. Slight background anxiety in the morning, reduced after lunch. Productivity was average."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -12, to: Date())!,
            score: .good,
            userDescription: "Good day. High focus window from 11:00 to 15:00. Social interactions felt neutral to positive."
        ),
        // skip -11
        Report(
            date: Calendar.current.date(byAdding: .day, value: -10, to: Date())!,
            score: .fair,
            userDescription: "Mood decreased noticeably. Likely causes: poor sleep + overstimulation. I should reduce inputs and simplify tasks tomorrow."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -9, to: Date())!,
            score: .okay,
            userDescription: "Recovery day. Lower emotional intensity. I intentionally avoided overplanning, which helped."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -8, to: Date())!,
            score: .good,
            userDescription: "Steady improvement. I completed key tasks without friction. Physical energy was higher than expected."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -7, to: Date())!,
            score: .great,
            userDescription: "Peak day this week. Clear mind, low internal resistance. Creative work felt efficient and satisfying."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -6, to: Date())!,
            score: .okay,
            userDescription: "Mild drop after a high day. This pattern repeats: strong day → energy rebound → neutral day. Not a problem, just expected."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -5, to: Date())!,
            score: .okay,
            userDescription: "A lot of work today, but overall okay."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -4, to: Date())!,
            score: .bad,
            userDescription: "Irritability increased. Probably due to workload + lack of quiet time. Need a controlled evening routine."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -3, to: Date())!,
            score: .okay,
            userDescription: "Mood normalized. No strong emotions. I did basic maintenance tasks and avoided perfectionism."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -2, to: Date())!,
            score: .okay,
            userDescription: "Good balance. I managed energy well and didn’t overextend. Sleep quality improved slightly."
        ),
        Report(
            date: Calendar.current.date(byAdding: .day, value: -1, to: Date())!,
            score: .okay,
            userDescription: "Stable positive mood. Fewer intrusive thoughts. I felt more confident about long-term direction."
        ),
        Report(
            date: Date(),
            score: .okay,
            userDescription: "Neutral day. Some fatigue, but manageable. Main goal: keep consistency instead of chasing peaks."
        )
    ]
}

extension MockRepository: Repository {
    func save(_ report: Report) {
        switch type {
        case .burnoutRU: burnoutRU.insert(report)
        case .impulsiveRU: impulsiveRU.insert(report)
        case .stableRU: stableRU.insert(report)
        case .analyticalEN: analyticalEN.insert(report)
        case .cynicalEN: cynicalEN.insert(report)
        case .romanticEN: romanticEN.insert(report)
        }
    }
    
    func fetchReports() -> [Report] {
        switch type {
        case .burnoutRU: return Array(burnoutRU)
        case .impulsiveRU: return Array(impulsiveRU)
        case .stableRU: return Array(stableRU)
        case .analyticalEN: return Array(analyticalEN)
        case .cynicalEN: return Array(cynicalEN)
        case .romanticEN: return Array(romanticEN)
        }
    }
    
    func fetchReports(sortBy descriptors: [SortDescriptor<Report>]) -> [Report] {
        let reports: Set<Report>
        
        switch type {
        case .burnoutRU: reports = burnoutRU
        case .impulsiveRU: reports = impulsiveRU
        case .stableRU: reports = stableRU
        case .analyticalEN: reports = analyticalEN
        case .cynicalEN: reports = cynicalEN
        case .romanticEN: reports = romanticEN
        }
        
        return reports.sorted(using: descriptors)
    }
    
    func fetchReports(filterBy predicate: Predicate<Report>) -> [Report] {
        let reports: Set<Report>
        
        switch type {
        case .burnoutRU: reports = burnoutRU
        case .impulsiveRU: reports = impulsiveRU
        case .stableRU: reports = stableRU
        case .analyticalEN: reports = analyticalEN
        case .cynicalEN: reports = cynicalEN
        case .romanticEN: reports = romanticEN
        }
        
        do {
            return try reports.filter(predicate)
        } catch {
            debugPrint(error.localizedDescription)
            return []
        }
    }
    
    func fetchReports(sortBy descriptors: [SortDescriptor<Report>], filterBy predicate: Predicate<Report>) -> [Report] {
        let reports: Set<Report>
        
        switch type {
        case .burnoutRU: reports = burnoutRU
        case .impulsiveRU: reports = impulsiveRU
        case .stableRU: reports = stableRU
        case .analyticalEN: reports = analyticalEN
        case .cynicalEN: reports = cynicalEN
        case .romanticEN: reports = romanticEN
        }
        
        do {
            return try reports.filter(predicate).sorted(using: descriptors)
        } catch {
            debugPrint(error.localizedDescription)
            return []
        }
    }
    
    func delete(_ report: Report) {
        switch type {
        case .burnoutRU: burnoutRU.remove(report)
        case .impulsiveRU: impulsiveRU.remove(report)
        case .stableRU: stableRU.remove(report)
        case .analyticalEN: analyticalEN.remove(report)
        case .cynicalEN: cynicalEN.remove(report)
        case .romanticEN: romanticEN.remove(report)
        }
    }
}
