"""
Details of a Ticket
"""
from uuid import uuid4
from datetime import datetime

from models.vehicle import Vehicle
from models.slot import ParkingSlot

class Ticket:
    def __init__(self, vehicle: Vehicle, slot: ParkingSlot) -> None:
        self.ticket_id = str(uuid4())
        self.vehicle = vehicle
        self.slot = slot
        self.entry_time = datetime.now()
    
    def bill_ticket(self) -> None:
        self.exit_time = datetime.now()
        self.bill = 50

    def print_ticket(self) -> None:
        """
        print the bill of the ticket in a semi-visual format
        """
        print(
            f"\tTicket: {self.ticket_id}\n"
            f"VEHICLE: {self.vehicle.license_plate}\n\n"
            f"{'-'}*100"
            f"Entry: {self.entry_time}\n"
            f"Exit: {self.exit_time}\n\n"
            f"Charge: {self.bill}\n"
            f"{'-'}*100"
        )
