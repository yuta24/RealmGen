import Foundation

let templateString = """
import Realm
import RealmSwift
{% for type in types %}
public class {{ type.realmName }}: Object {
    {% for property in type.properties %}
    {% if property.initialValue %}@objc dynamic var {{ property.name }}: {{ property.typeName }} {{ property.initialValue }}{% else %}@objc dynamic var {{ property.name }}: {{ property.typeName }}{% endif %}
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
        {% for property in type.properties %}
        self.{{ property.name }} = entity.{{ property.name }}
        {% endfor %}
    }
}
{% endfor %}
"""

do {
    let code = try Generator(arguments: CommandLine.arguments).execute(with: templateString)
    print(code)
} catch {
    print(error.localizedDescription)
    // TODO: Impl
}
