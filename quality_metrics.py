# Copyright 2021 NREL

# Licensed under the Apache License, Version 2.0 (the "License"); you may not
# use this file except in compliance with the License. You may obtain a copy of
# the License at http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations under
# the License.

# See https://floris.readthedocs.io for documentation

import sys
import numpy as np
import datetime

from flasc.timing_tests.energy_ratio_timing import time_energy_ratio_with_bootstrapping

    

if __name__=="__main__":

    commit_hash = sys.argv[1]

    energy_ratio_bootstrap_time = time_energy_ratio_with_bootstrapping()


    # print("{:.4f}, {:.4f}, {:.4f}, {:.4f},".format(time_jensen, time_gauss, time_gch, time_cc))
    print(
        f"(\"{commit_hash}\", \"{commit_hash[0:8]}\", {datetime.date.today( )}, "
        f"{energy_ratio_bootstrap_time:.4f}, "
        f"\"{commit_hash[0:8]}\")"
    )
