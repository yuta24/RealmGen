import Foundation
import RealmGenKit

let templateString = """
{% for type in types %}
public class {{ type.realmName }}: Object {
    {% for property in type.properties %}
    @objc dynamic var {{ property.name }}: {{ property.typeName }}
    {% endfor %}
}

extension {{ type.realmName }} {
    convenience init(_ model: {{ type.name }}) {
        self.init()
        {% for property in type.properties %}
        self.{{ property.name }} = model.{{ property.name }}
        {% endfor %}
    }
}

extension {{ type.name }} {
    public init(_ entity: {{ type.name }}) {
        self.init()
        {% for property in type.properties %}
        self.{{ property.name }} = model.{{ property.name }}
        {% endfor %}
    }
}
{% endfor %}
"""

do {
    try Generator(arguments: CommandLine.arguments).execute(with: templateString)
} catch {
    print(error.localizedDescription)
    // TODO: Impl
}
