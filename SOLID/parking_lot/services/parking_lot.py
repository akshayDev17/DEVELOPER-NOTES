"""
the main parking lot object
"""
from models.floor import ParkingFloor
from models.slot import ParkingSlot
from models.ticket import Ticket

from services.parking_strategy import SlotAllocationStrategy

from models.floor import ParkingFloor
from models.ticket import Ticket
from services.parking_strategy import SlotAllocationStrategy


class ParkingLot:
    def __init__(self, floors: list[ParkingFloor], strategy: SlotAllocationStrategy):
        self.floors = floors
        self.strategy = strategy
        self.active_tickets: dict[str, Ticket] = {}

    def park(self, vehicle):
        slot = self.strategy.find_slot(self.floors, vehicle)
        if not slot:
            print("No available slot")
            return None

        ticket = Ticket(vehicle, slot)
        self.active_tickets[ticket.ticket_id] = ticket
        
        slot.park(vehicle)

        print(f"Parked at {slot.slot_id}, Ticket ID: {ticket.ticket_id}")
        return ticket

    def unpark(self, ticket_id: str):
        ticket = self.active_tickets.get(ticket_id)
        if not ticket:
            print("Invalid ticket")
            return False

        slot = ticket.slot
        slot.parked_vehicle = None
        slot.is_occupied = False
        del self.active_tickets[ticket_id]
        print(f"Unparked vehicle {ticket.vehicle.license_plate} from {slot.slot_id}")
        return True
