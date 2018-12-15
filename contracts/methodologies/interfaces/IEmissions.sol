pragma solidity ^0.4.24;


interface IEmissions {

    function calculate(bytes data) external view returns (int256);

}
