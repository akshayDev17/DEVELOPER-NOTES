from models.slot import ParkingSlot
from models.floor import ParkingFloor
from services.parking_lot import ParkingLot
from services.vehicle_factory import VehicleFactory
from services.parking_strategy import NearestSlotStrategy
from models.vehicle import VehicleType

# Create slots
slots = [ParkingSlot(slot_id = f"S{i}", slot_type = VehicleType.CAR, distance_from_entry=i) for i in range(1, 6)]
floor = ParkingFloor("F1", slots)
strategy = NearestSlotStrategy()

# Create parking lot
parking_lot = ParkingLot([floor], strategy)

# Create vehicle
car = VehicleFactory.create_vehicle(vehicle_type=VehicleType.CAR, 
                                    license_plate="KA01AB1234")

# Park
ticket = parking_lot.park(car)

# Unpark
if ticket:
    parking_lot.unpark(ticket.ticket_id)
