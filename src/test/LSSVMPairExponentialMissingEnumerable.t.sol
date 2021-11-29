// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.0;

import {DSTest} from "ds-test/test.sol";

import {ExponentialCurve} from "../bonding-curves/ExponentialCurve.sol";
import {Test721} from "../mocks/Test721.sol";
import {IERC721Mintable} from "./IERC721Mintable.sol";
import {ICurve} from "../bonding-curves/ICurve.sol";
import {LSSVMPairBaseTest} from "./base/LSSVMPairBase.sol";
import {PRBMathUD60x18} from "prb-math/PRBMathUD60x18.sol";

contract LSSVMPairExponentialMissingEnumerableTest is DSTest, LSSVMPairBaseTest {

    function setupCurve() override public returns (ICurve){
        return new ExponentialCurve();
    }
    
    function setup721() override public returns (IERC721Mintable){
        return IERC721Mintable(address(new Test721()));
    }

    function modifyDelta(uint64 delta) override public pure returns (uint64) {
        if (delta <= PRBMathUD60x18.SCALE) {
            return uint64(PRBMathUD60x18.SCALE + delta + 1);
        }
        else {
            return delta;
        }
    }
}