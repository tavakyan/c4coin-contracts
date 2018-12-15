pragma solidity ^0.4.24;


interface IAdditionality {

    function verify(bytes data) external view returns (bool);

}
