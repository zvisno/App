For instructions on distributing this challenge, please see the wiki.

# Challenge for Test Engineer Role

### This is a Challenge:

This application works but has no tests. Please add tests to this project so that
it is covered to a level you feel comfortable with. You will not have so much
time so we do not expect full coverage. It's up to you to decide what you want
to show us.

### Specification:

This application accepts a file upload and displays the progress to the user
as it's being uploaded.

- When the user picks a file from their computer and the form is submitted, the upload begins.
- While uploading, the status text paragraph should be updating with the
current percentage complete at least once every 2 seconds.
- While uploading, the user should be able to enter text into the title
text field.

- When the upload completes, the status text should display the path on the server to the saved file,
and the current value of the title text field should be posted to the server.
- The response to the form post request should display both the title and the path to the file.

### Requirements:

- The upload should honor proxy settings on the browser
- The server must support at least 2 concurrent uploads from different users
- This is a ruby project so any unit tests you write will need to be in ruby.
If you don't know ruby and would prefer another language, let us know.


### Run it:

    cd test-challenge/
    rvm use 1.9.2
    ruby app.rb

