<%

use TestDouble;

class TestDoubleTest extends Test {
    def test_attributes {
        double = TestDouble.new({ "a" => "b", "c" => "d" });
        assert_equal("b", double.a);
        assert_equal("d", double.c);
    }

    def test_closures {
        double = TestDouble.new({ "z" => \{ "x" } });
        assert_equal("x", double.z);
    }

    def test_unexpected_message {
        double = TestDouble.new();
        assert_throws(UnexpectedMessageError, \{ double.undefined_method });
        assert_throws(UnexpectedMessageError, \{ double.undefined_method("with_argument") });
    }
}.register;
