MyLife is a simple command line app to track daily stats on your life.  It copies over a template file which you can personalize to a path for the date, and opens it up in your favorite $EDITOR.

Usage: 
  $ my_life                # creates/edits today's yml file
  $ my_life y[esterday]    # creates/edits yesterday's yml file
  $ my_life 5[ days ago]   # creates/edits the file for 5 days ago

Stats are stored in .yml files in records/year/month/day.yml

The records/template.yml file is copied over when you edit a days file

You can modify the editor used to open the files with the EDITOR env variable.
