<%

class UnexpectedMessageError extends Error {};

class TestDouble {
    def self.new(attributes={}) {
        klass = Class.new;

        attributes.each(\attr {
            name = attr[0];
            value = attr[1];
            klass.define_method(name, \{
                if(value.responds_to("call")) {
                    value.call();
                } else {
                    value;
                }
            });
        });

        klass.define_method("method_missing", \(args) {
            message = "Test Double #{self} received unexpected message #{args}";
            throw UnexpectedMessageError.new(message);
        });
        klass.new;
    }
}
