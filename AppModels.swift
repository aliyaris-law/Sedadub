import Foundation
import SwiftUI

// MARK: - Translation Engine Mode

enum TranslationEngineMode: String, CaseIterable, Identifiable, Codable {
    case customVoiceLive = "custom_voice_live"
    case dedicatedLiveTranslate = "dedicated_live_translate"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .customVoiceLive:
            return "دوبله با انتخاب صدای دلخواه (Gemini Live)"
        case .dedicatedLiveTranslate:
            return "مترجم پیوسته فوق‌سریع (Live Translate)"
        }
    }

    var subtitle: String {
        switch self {
        case .customVoiceLive:
            return "امکان انتخاب بین ۲۰+ صدای مختلف گوگل (مرد/زن) با دستورالعمل ترجمه همزمان"
        case .dedicatedLiveTranslate:
            return "مدل اختصاصی ترجمه پیوسته گوگل (بدون توقف بین جملات، حفظ لحن گوینده)"
        }
    }

    var defaultModelID: String {
        switch self {
        case .customVoiceLive:
            return "gemini-2.5-flash-native-audio-preview-12-2025"
        case .dedicatedLiveTranslate:
            return "gemini-3.5-live-translate-preview"
        }
    }
}

// MARK: - Audio Input Source

enum AudioSourceMode: String, CaseIterable, Identifiable {
    case localVideo = "local_video"
    case liveMicrophone = "live_microphone"
    case systemBroadcast = "system_broadcast"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .localVideo: return "ویدیوی محلی"
        case .liveMicrophone: return "میکروفون زنده"
        case .systemBroadcast: return "صدای کل آیپد (YouTube/Safari)"
        }
    }

    var systemImage: String {
        switch self {
        case .localVideo: return "film.stack"
        case .liveMicrophone: return "mic.fill"
        case .systemBroadcast: return "record.circle"
        }
    }
}

// MARK: - Google Gemini Prebuilt Voices

enum VoiceGender: String, CaseIterable, Identifiable, Codable {
    case all = "همه"
    case female = "زن"
    case male = "مرد"

    var id: String { rawValue }
}

struct GoogleVoice: Identifiable, Hashable, Codable {
    let id: String // Exact Gemini API prebuiltVoiceConfig voiceName
    let displayName: String
    let gender: VoiceGender
    let stylePersian: String
    let styleEnglish: String

    static let catalog: [GoogleVoice] = [
        // Female Voices
        GoogleVoice(id: "Aoede", displayName: "Aoede (آئوده)", gender: .female, stylePersian: "ملایم و روان", styleEnglish: "Breezy"),
        GoogleVoice(id: "Kore", displayName: "Kore (کوره)", gender: .female, stylePersian: "قاطع و خبری", styleEnglish: "Firm"),
        GoogleVoice(id: "Zephyr", displayName: "Zephyr (زفیر)", gender: .female, stylePersian: "شفاف و پرانرژی", styleEnglish: "Bright"),
        GoogleVoice(id: "Leda", displayName: "Leda (لدا)", gender: .female, stylePersian: "جوان و صمیمی", styleEnglish: "Youthful"),
        GoogleVoice(id: "Despina", displayName: "Despina (دسپینا)", gender: .female, stylePersian: "نرم و طبیعی", styleEnglish: "Smooth"),
        GoogleVoice(id: "Erinome", displayName: "Erinome (ارینومه)", gender: .female, stylePersian: "واضح و شمرده", styleEnglish: "Clear"),
        GoogleVoice(id: "Callirrhoe", displayName: "Callirrhoe (کالیرهو)", gender: .female, stylePersian: "آرام و دوستانه", styleEnglish: "Easy-going"),
        GoogleVoice(id: "Autonoe", displayName: "Autonoe (اتونوه)", gender: .female, stylePersian: "روشن و دلنشین", styleEnglish: "Bright"),
        GoogleVoice(id: "Gacrux", displayName: "Gacrux (گاکروکس)", gender: .female, stylePersian: "پخته و مستند", styleEnglish: "Mature"),
        GoogleVoice(id: "Sulafat", displayName: "Sulafat (سلافات)", gender: .female, stylePersian: "گرم و روایتگر", styleEnglish: "Warm"),
        // Male Voices
        GoogleVoice(id: "Puck", displayName: "Puck (پاک)", gender: .male, stylePersian: "شاداب و پرانرژی", styleEnglish: "Upbeat"),
        GoogleVoice(id: "Charon", displayName: "Charon (کارون)", gender: .male, stylePersian: "اطلاع‌رسان و رسمی", styleEnglish: "Informative"),
        GoogleVoice(id: "Fenrir", displayName: "Fenrir (فنریر)", gender: .male, stylePersian: "پرحرارت و سینمایی", styleEnglish: "Excitable"),
        GoogleVoice(id: "Orus", displayName: "Orus (اوروس)", gender: .male, stylePersian: "محکم و جدی", styleEnglish: "Firm"),
        GoogleVoice(id: "Iapetus", displayName: "Iapetus (یاپتوس)", gender: .male, stylePersian: "شفاف و دقیق", styleEnglish: "Clear"),
        GoogleVoice(id: "Enceladus", displayName: "Enceladus (انسلادوس)", gender: .male, stylePersian: "نفس‌دار و آرام", styleEnglish: "Breathy"),
        GoogleVoice(id: "Algieba", displayName: "Algieba (الجبهه)", gender: .male, stylePersian: "نرم و پادکستی", styleEnglish: "Smooth"),
        GoogleVoice(id: "Rasalgethi", displayName: "Rasalgethi (راس‌الجثی)", gender: .male, stylePersian: "آموزشی و تحلیلی", styleEnglish: "Informative"),
        GoogleVoice(id: "Alnilam", displayName: "Alnilam (النظام)", gender: .male, stylePersian: "مقتدر و بم", styleEnglish: "Firm"),
        GoogleVoice(id: "Umbriel", displayName: "Umbriel (آمبریل)", gender: .male, stylePersian: "راحت و محاوره‌ای", styleEnglish: "Easy-going")
    ]
}

// MARK: - Supported Languages (BCP-47)

struct TranslationLanguage: Identifiable, Hashable, Codable {
    let code: String // BCP-47 code
    let namePersian: String
    let englishName: String
    let isRTL: Bool

    var id: String { code }

    static let catalog: [TranslationLanguage] = [
        TranslationLanguage(code: "fa", namePersian: "فارسی", englishName: "Persian", isRTL: true),
        TranslationLanguage(code: "en", namePersian: "انگلیسی", englishName: "English", isRTL: false),
        TranslationLanguage(code: "ar", namePersian: "عربی", englishName: "Arabic", isRTL: true),
        TranslationLanguage(code: "tr", namePersian: "ترکی استانبولی", englishName: "Turkish", isRTL: false),
        TranslationLanguage(code: "de", namePersian: "آلمانی", englishName: "German", isRTL: false),
        TranslationLanguage(code: "fr", namePersian: "فرانسوی", englishName: "French", isRTL: false),
        TranslationLanguage(code: "es", namePersian: "اسپانیایی", englishName: "Spanish", isRTL: false),
        TranslationLanguage(code: "ru", namePersian: "روسی", englishName: "Russian", isRTL: false),
        TranslationLanguage(code: "it", namePersian: "ایتالیایی", englishName: "Italian", isRTL: false),
        TranslationLanguage(code: "zh-Hans", namePersian: "چینی (ساده‌شده)", englishName: "Chinese (Simplified)", isRTL: false),
        TranslationLanguage(code: "ja", namePersian: "ژاپنی", englishName: "Japanese", isRTL: false),
        TranslationLanguage(code: "ko", namePersian: "کره‌ای", englishName: "Korean", isRTL: false)
    ]
}

// MARK: - Subtitle Customization Settings

enum SubtitleDisplayMode: String, CaseIterable, Identifiable, Codable {
    case translatedOnly = "translated_only"
    case bilingual = "bilingual"
    case originalOnly = "original_only"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .translatedOnly: return "فقط ترجمه"
        case .bilingual: return "دوزبانه (اصلی + ترجمه)"
        case .originalOnly: return "فقط متن اصلی"
        }
    }
}

enum SubtitleColorPreset: String, CaseIterable, Identifiable, Codable {
    case white = "white"
    case yellow = "yellow"
    case cyan = "cyan"
    case mint = "mint"

    var id: String { rawValue }

    var title: String {
        switch self {
        case .white: return "سفید"
        case .yellow: return "زرد سینمایی"
        case .cyan: return "فیروزه‌ای"
        case .mint: return "سبز نعنایی"
        }
    }

    var swiftUIColor: Color {
        switch self {
        case .white: return .white
        case .yellow: return Color(red: 1.0, green: 0.92, blue: 0.35)
        case .cyan: return Color(red: 0.45, green: 0.92, blue: 1.0)
        case .mint: return Color(red: 0.55, green: 1.0, blue: 0.78)
        }
    }
}

struct SubtitleSettings: Codable, Equatable {
    var isEnabled: Bool = true
    var displayMode: SubtitleDisplayMode = .bilingual
    var fontSize: Double = 24
    var isBold: Bool = true
    var textColor: SubtitleColorPreset = .white
    var backgroundOpacity: Double = 0.72
    var cornerRadius: Double = 14
    var maxLines: Int = 3
    var showShadow: Bool = true
}

// MARK: - Live Transcript Entry

struct TranscriptEntry: Identifiable, Equatable {
    let id = UUID()
    let timestamp: Date
    var originalText: String
    var translatedText: String
}

// MARK: - Connection State

enum LiveConnectionState: Equatable {
    case disconnected
    case connecting
    case connected
    case error(String)

    var label: String {
        switch self {
        case .disconnected: return "آماده اتصال"
        case .connecting: return "در حال اتصال..."
        case .connected: return "متصل (زنده)"
        case .error(let msg): return "خطا: \(msg)"
        }
    }

    var isConnected: Bool {
        if case .connected = self { return true }
        return false
    }
}
