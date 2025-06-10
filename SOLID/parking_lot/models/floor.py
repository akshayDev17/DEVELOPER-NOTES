"""
Details of the parking floor
"""
from typing import List, Optional

from models.vehicle import Vehicle
from models.slot import ParkingSlot

class ParkingFloor:
    """
    stores all relevant information for a parking floor
    """
    def __init__(self, floor: str, slots: List[ParkingSlot]) -> None:
        """
        Initialise a parking floor instance using given params
        """
        self.floor = floor
        self.slots = sorted(slots, key=lambda slot: slot.distance_from_entry)
    def find_nearest_slot(self, vehicle: Vehicle) -> Optional[ParkingSlot]:
        """
        """
        for slot in self.slots:
            if not slot.is_occupied and slot.slot_type == vehicle.vehicle_type:
                # park the incoming vehicle in an unoccupied slot which is
                # meant for its vehicle type
                return slot
        return None
