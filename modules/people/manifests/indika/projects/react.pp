class people::indika::projects::react
{
    package { 'node':
        ensure   =>  "latest",
        provider => "homebrew",
    }

    # Then set up browserify
    # npm install -g browserify


}
