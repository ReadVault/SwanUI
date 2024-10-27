struct Button<Children: HTML>: HTML {
    let action: Action
    let children: () -> Children

    var content: some HTML {
        button {
            children()
        }.attributes()
    }

    init(onClick: (() -> Void)? = nil, @HTMLBuilder content: @escaping () -> Children) {
        @Environment(requiring: EnvironmentValues.$actionBuilder) var actionBuilder
        @Environment(requiring: EnvironmentValues.$route) var route

        action =
            if let onClick {
                actionBuilder.register(action: onClick, on: route)
            } else {
                .empty()
            }
        children = content
    }

    func onClick(action onClick: @escaping () -> Void) -> Self {
        .init(
            onClick: onClick,
            content: children
        )
    }
}
