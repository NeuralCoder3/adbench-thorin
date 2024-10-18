# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

from dataclasses import dataclass, field
from typing import Tuple
import numpy as np

from output_utils import save_vector_to_file, objective_file_name,\
                            save_jacobian_to_file, jacobian_file_name

@dataclass
class HandModel:
    bone_count: \
        int = field(default_factory=lambda: 0)

    bone_names: \
        Tuple[str] = field(default_factory=lambda: tuple())
    
    # asssuming that parent is earlier in the order of bones
    parents: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.int32))

    base_relatives: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))

    inverse_base_absolutes: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))

    base_positions: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))

    weights: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))
    
    # two dimensional array with the second dimension equals to 3
    triangles: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.int32))

    is_mirrored: \
        bool = field(default_factory=lambda: False)

@dataclass
class HandData:
    model: \
        HandModel = field(default_factory=lambda: HandModel())

    correspondences: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.int32))

    points: \
        np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))



@dataclass
class HandInput:
    theta:      np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))
    data:       HandData = field(default_factory=lambda: HandData())
    us:         np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))

@dataclass
class HandOutput:
    objective:  np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))
    jacobian:   np.ndarray = field(default_factory=lambda: np.empty(0, dtype = np.float64))

    def save_output_to_file(
        self,
        output_prefix,
        input_basename,
        module_basename
    ):
        save_vector_to_file(
            objective_file_name(output_prefix, input_basename, module_basename),
            self.objective
        )

        save_jacobian_to_file(
            jacobian_file_name(output_prefix, input_basename, module_basename),
            self.jacobian
        )

@dataclass
class HandParameters:
    is_complicated: bool = field(default_factory=lambda: False)