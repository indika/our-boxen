class people::indika::projects::graph
{
    package { 'neo4j':
        ensure   =>  "latest",
        provider => "homebrew",
    }

    # I'll need a virtualenv
    # Then consider Python packages
    # Py2Neo

    # Or I can go with the Haskell route

}
