struct ActionableElement<Content: HTML>: HTML where Content.Tag: HTMLTrait.Attributes.Global {
    let _content: Content
    let action: Action

    var content: some HTML {
        _content.attributes(.on(.click, action.script))
    }

    init(content: Content, onClick: () -> Void) {
        @Environment(requiring: EnvironmentValues.$actionBuilder) var actionBuilder
        @Environment(requiring: EnvironmentValues.$route) var route

        _content = content
        action = actionBuilder.register(action: onClick, on: route)
    }

}

extension HTML where Tag: HTMLTrait.Attributes.Global {
    func onClick(action onClick: @escaping () -> Void) -> ActionableElement<Self> {
        .init(
            content: self,
            onClick: onClick
        )
    }
}
