pragma solidity ^0.4.24;

import "../contracts/Assert.sol";
import "./Koans.sol";

/*
    In this level, we learn about ints and uints in Solidity
    We throw out previous conventions
    And open our mind to new possibilities
*/
contract Test_Numbers_2 is Koans {

    /*  TODO
        test_solidity_supports_ints_and_uints() {
            
        }
    */

    // Ethereum's smart contract storage slots are 256 bits each, or 32 bytes
    // Storing things to the blockhain costs money (ethers/gas)
    // You can save money by allocating sizes
    function test_you_can_specify_storage_size() public {
        uint8 eight_bits;
        uint16 sixteen_bits;
        
        // TODO: set max_bits to the largest possible uint that can be stored in 256 bits
        uint256 max_bits = 0; 
        uint max_default_bits = max_bits; //uint defaults to uint256
        Assert.isAtLeast(max_default_bits, 115792089237316195423570985008687907853269984665640564039457584007913129639934, "the default int value should have the largest storage space");
    }

    // you can modify storage size, but shrinking storage might lose data

    // In Solidity, there's no "nil" or "null" or "undefined" default value
    // Uninitiated values are set to 0 by default
    function test_nil_ints_equal_zero() public {
        int actual;

        // TODO: fix this expected value
        int expected = 1;
        Assert.equal(expected, actual, "nil values should default to 0");  
    }

    // You can do bit operation on ints
    function test_bitwise_operator_and() public {
        uint integer = 42;          //or 101010 bitwise
        uint mask = 56;             //or 111000 bitwise
        uint actual = integer & mask; //or 101000 bitwise

        // TODO: give the expected uint value of the bitwise
        uint expected = 0;     
        Assert.equal(expected, actual, "should equal bitwise (integer AND mask)");
    }

    function test_bitwise_operator_xor() public {
        uint integer = 42;          //or 101010 bitwise
        uint mask = 56;             //or 111000 bitwise
        uint actual = integer ^ mask; //or 010010 bitwise

        // TODO: give the expected uint value of the bitwise
        uint expected = 0;     
        Assert.equal(expected, actual, "should equal bitwise (integer XOR mask)");
    }

    // You can shift binary values
    function test_left_shift_operand() public {
        uint a = 555555;
        uint b = 5;

        // TODO: Change n to represent the correct shift base value
        uint n = 3;
        uint expected = a<<b;
        uint actual = a * n**b;     //** is exponentiation
        Assert.equal(expected, actual, "should correctly shift binary left");
    }

    // refactor: test ints can be added and subtracted
    // You can do basic arithmetic operations on ints
    function test_ints_can_be_mathed() public {
        
        // TODO: change the values of "a" and "b" to pass the tests
        // add, subtract, divide, mod, **
        int a = 5;
        int b = -32;
        int expected_sum = 3;
        int expected_diff = -1;
        Assert.equal(expected_sum, (a+b), "should correctly sum a + b");
        Assert.equal(expected_diff, (a-b), "should correctly subtract a + b");
    }

    // todo: test ints can be operator compared ==,


    // Beware of arithmetic underflows
    function test_arithmetic_underflows() public {
        uint min = 0;
        uint result = min - 1;
        
        // TODO: change the test to expect the correct outcome
        Assert.isAtMost(result, min, "result should be 0 or less than 0");
    }

    // Beware of arithmetic overflows
    function test_arithmetic_overflows() public {
        uint max = MAX_UINT;
        uint result = max + 1;
        
        // TODO: change the test to expect the correct outcome
        Assert.isAtLeast(result, max, "result should be 255 or above 255");
    }

    // Read about the security issues of arithmetic flows here: 
    // https://medium.com/coinmonks/ethernaut-lvl-5-walkthrough-how-to-abuse-arithmetic-underflows-and-overflows-2c614fa86b74
}