pragma solidity 0.4.24;

import "../interfaces/IAdditionality.sol";
import "../interfaces/IEmissions.sol";
import "../interfaces/IEmissionsReduction.sol";


contract EmissionsReduction is IEmissionsReduction {

    IEmissions internal baseline;
    IEmissions internal project;
    IEmissions internal leakage;
    IAdditionality internal additionality;

    constructor(
        IAdditionality _additionality,
        IEmissions _baseline,
        IEmissions _project,
        IEmissions _leakage) {

        additionality = _additionality;
        baseline = _baseline;
        project = _project;
        leakage = _leakage;
    }

    function calculate(
        bytes additionalityData,
        bytes baselineData,
        bytes projectData,
        bytes leakageData)
        external view returns (uint256) {

        bool additionalityCriteria = additionality.verify(additionalityData);
        require(additionalityCriteria);

        int256 baselineEmissions = baseline.calculate(baselineData);
        int256 projectEmissions = project.calculate(projectData);
        int256 leakageEmissions = leakage.calculate(leakageData);

        // TODO: Add FixedPointSafeMath.  Convert to int256?
        require(projectEmissions > leakageEmissions);
        require(baselineEmissions > projectEmissions + leakageEmissions);

        return uint256(baselineEmissions - projectEmissions - leakageEmissions);

    }

}
