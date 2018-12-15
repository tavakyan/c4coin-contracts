pragma solidity ^0.4.24;


/**
 * @title BytesUtil
 * @dev Convert bytes dynamic array to a static array of signed 32-bit integers
 */
library BytesUtil {
    /* function toSignedArray(bytes memory b) private pure returns (int32[16] signedArray) {
        uint l = signedArray.length * 4; // 4 bytes per int32
        require(b.length == l);
        assembly {
          signedArray := mload(add(b, l))
        }
    } */

    function toInt32(uint _offst, bytes memory _input) pure returns (int32 _output) {

        assembly {
            _output := mload(add(_input, _offst))
        }
    }

    function toInt32Array(uint _offset, bytes memory _input) pure returns (int32[16] _output) {

    }

    function bytesToString(uint _offst, bytes memory _input, bytes memory _output) internal  {

        uint size = 32;
        assembly {
            let loop_index:= 0
                  
            let chunk_count

            size := mload(add(_input,_offst))
            chunk_count := add(div(size,32),1) // chunk_count = size/32 + 1

            if gt(mod(size,32),0) {
                chunk_count := add(chunk_count,1)  // chunk_count++
            }


            loop:
                mstore(add(_output,mul(loop_index,32)),mload(add(_input,_offst)))
                _offst := sub(_offst,32)           // _offst -= 32
                loop_index := add(loop_index,1)

            jumpi(loop , lt(loop_index , chunk_count))

        }
    }
}
