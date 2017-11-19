from django.core.management.commands.migrate import Command as BaseCommand
from django.core.management import call_command


class Command(BaseCommand):

    def add_arguments(self, parser):
        super(Command, self).add_arguments(parser)
        parser.add_argument("--not-create-user-fixture",
                            dest="user_fixtures",
                            action="store_false",
                            default=True,
                            help="it create user fixture")

        parser.add_argument("--not-create-booking-fixture",
                            dest="booking_fixtures",
                            action="store_false",
                            default=True,
                            help="it create user fixture")

    def handle(self, *args, **options):
        output = super(Command, self).handle(*args, **options)
        if options["user_fixtures"]:
            call_command('loaddata', 'sas/user/fixtures/permissions.json')
            call_command('loaddata', 'sas/user/fixtures/group.json')
            call_command('loaddata', 'sas/user/fixtures/user.json')
            call_command('loaddata', 'sas/user/fixtures/users.json')
            call_command('loaddata', 'sas/user/fixtures/userprofile.json')
            call_command('loaddata', 'sas/user/fixtures/settings.json')

        if options["booking_fixtures"]:
            call_command('loaddata', 'sas/booking/fixtures/buildings.json')
            call_command('loaddata', 'sas/booking/fixtures/places.json')
            call_command('loaddata', 'sas/booking/fixtures/bookTimes.json')
            call_command('loaddata', 'sas/booking/fixtures/bookings.json')

        return output
