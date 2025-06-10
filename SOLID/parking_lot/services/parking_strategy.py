"""
All parking strategies should end up here
"""
from abc import ABC, abstractmethod
from typing import Optional, List

from models.floor import ParkingFloor
from models.vehicle import Vehicle
from models.slot import ParkingSlot

class SlotAllocationStrategy(ABC):
    """
    """
    @abstractmethod
    def find_slot(self, floors: List[ParkingFloor], vehicle: Vehicle) -> Optional[ParkingSlot]:
        pass

class NearestSlotStrategy(SlotAllocationStrategy):
    """
    """
    def find_slot(self, floors: list[ParkingFloor], vehicle: Vehicle):
        for floor in floors:
            slot = floor.find_nearest_slot(vehicle)
            if slot:
                return slot
        return None
    
        