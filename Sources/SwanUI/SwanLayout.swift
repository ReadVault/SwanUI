@_exported import Elementary

public protocol SwanLayout: HTML {
    init<Content>(content: Content) where Content: HTML
}
