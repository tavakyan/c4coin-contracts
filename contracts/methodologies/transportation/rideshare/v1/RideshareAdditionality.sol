pragma solidity 0.4.24;

import "../../../interfaces/IAdditionality.sol";
/* import "../../../libraries/BytesUtil.sol"; */


contract RideshareAdditionality is IAdditionality {

    enum AdditionalityParamTypes {
        NumCommunityPoolHHI,
        DenCommunityPoolHHI,
        NumUserPoolFreq,
        DenUserPoolFreq
    }

    function bytesToInt32(uint _offst, bytes memory _input) internal pure returns (int32 _output) {
        assembly {
            _output := mload(add(_input, _offst))
        }
    }

    function bytesToInt32Array(uint _offst, bytes memory _input) internal pure returns (int32[16] _output) {

        bytes offset = 512;
        int32 n2;

        n2 = bytesToInt32(offset, buffer);
        offset -= sizeOfInt(32);

    }


    function verify(bytes data) external view returns (bool) {

        /* int32[16] intData = toSignedArray(data);
        uint l = data.length; */
        // If rideshare pool is dominant market in community then not additional.
        /* int32 numHHI = data[uint(AdditionalityParamTypes.NumCommunityPoolHHI)];

        if (numHHI >= 2500) {
            return false;
        }

        int32 numUserPoolFreq = data[uint(AdditionalityParamTypes.NumUserPoolFreq)];
        if (numUserPoolFreq <= 36) {
            return false;
        } */

        return true;
    }

}
