pragma solidity ^0.4.24;


interface IEmissionsReduction {

    function calculate(
        bytes additionalityData,
        bytes baselineData,
        bytes projectData,
        bytes leakageData
        )
        external view returns (uint256);

}
