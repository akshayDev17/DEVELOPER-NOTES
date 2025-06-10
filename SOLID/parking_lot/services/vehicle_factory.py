"""
Factory-design pattern implementation to create an instance of a vehicle 
"""
from abc import ABC
from models.vehicle import VehicleType, Bike, Car, Truck

class VehicleFactory(ABC):
    @staticmethod
    def create_vehicle(license_plate: str, vehicle_type: VehicleType):
        if vehicle_type == VehicleType.BIKE:
            return Bike(license_plate=license_plate)
        elif vehicle_type == VehicleType.CAR:
            return Car(license_plate=license_plate)
        elif vehicle_type == VehicleType.TRUCK:
            return Truck(license_plate=license_plate)
        else:
            raise ValueError(f"vehicle of provided type {vehicle_type} "
                             f"doesn't exist.")
        
