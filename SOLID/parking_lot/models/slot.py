"""
Stores all details related to a parking slot
"""
from typing import Union

from models.vehicle import VehicleType, Vehicle

class ParkingSlot:
    def __init__(self, 
                 slot_id: str,
                 distance_from_entry: Union[float, int], 
                 slot_type: VehicleType) -> None:
        """
        Initialise a parking slot instance using given params
        """
        self.slot_id = slot_id
        self.distance_from_entry = distance_from_entry
        self.slot_type = slot_type
        self.is_occupied = False
        self.parked_vehicle = None
    
    def park(self, vehicle_to_park: Vehicle) -> None:
        """
        Simply park the given vehicle at the current parking slot.
        All decision-making has already been done in ParkingStrategy
        """
        self.is_occupied = True
        self.parked_vehicle = vehicle_to_park
    
    def unpark(self) -> None:
        """
        Simply unpark the given vehicle at the current parking slot.
        All decision-making has already been done in ParkingStrategy
        """
        self.is_occupied = False
        self.parked_vehicle = None
    