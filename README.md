# eHKT-User

This project provides a frontend for an eHealth-Card-Terminal (eHKT).
1. The user chooses an eHKT he would like to work with.
2. The user chooses a Konnektor-Identity he would like to use in a TLS-handshake.
3. The user chooses a cipher-suite to be used during the TLS-handshake.
4. The user provides a "shared secret" for pairing.

The program
1. performs a TLS-handshake,
2. check or establish a pairing block and
3. performs commands from a text field, see [examples](examples/000_example.txt)

## Prerequisites
This project needs a Java Runtime Environment JRE 21 or higher.

## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Roadmap
Currently, there is no roadmap.

## Contributing
Contributions are welcome.

## Authors and acknowledgment
1. <a href="mailto:software-development&#64;gematik.de">software-development@gematik.de</a>

## License
See the [License](LICENSE) file.

## Project status
This project is active.
