"""
Define all things relevant to a vehicle
"""
from enum import Enum
from abc import ABC

class VehicleType(Enum):
    BIKE = "Bike"
    CAR = "Car"
    TRUCK = "Truck"

class Vehicle(ABC):
    def __init__(self, license_plate: str, vehicle_type: VehicleType) -> None:
        self.license_plate = license_plate
        self.vehicle_type = vehicle_type

class Bike(Vehicle):
    def __init__(self, license_plate: str) -> None:
        super().__init__(license_plate, VehicleType.BIKE)

class Car(Vehicle):
    def __init__(self, license_plate: str) -> None:
        super().__init__(license_plate, VehicleType.CAR)

class Truck(Vehicle):
    def __init__(self, license_plate: str) -> None:
        super().__init__(license_plate, VehicleType.TRUCK)
