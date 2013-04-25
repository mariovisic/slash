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
}.register;
