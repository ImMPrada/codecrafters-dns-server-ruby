# DNS Header Implementation

## English

### What is a DNS Header?

The DNS header is the first part of every DNS message, whether it's a query (asking for information) or a response (providing information). Think of it as an envelope that contains important instructions about the DNS message inside.

### Structure Overview

The header is 12 bytes long and contains several fields that serve different purposes:

1. **Message Identification (ID)** - 16 bits
   - A unique number that matches queries with their responses
   - Like a tracking number for your DNS message

2. **Control Flags** - 16 bits total
   - `qr`: Is this a question (0) or an answer (1)?
   - `opcode`: What kind of query is this? (Usually 0 for standard query)
   - `aa`: Is this server an authority for this domain?
   - `tc`: Was the message too long and had to be cut off?
   - `rd`: Should the server chase down the complete answer?
   - `ra`: Can the server chase down answers?
   - `z`: Reserved for future use
   - `rcode`: Did something go wrong? What kind of error?

3. **Section Counters** - 16 bits each
   - `qdcount`: How many questions are we asking?
   - `ancount`: How many answers are we providing?
   - `nscount`: How many name servers are we referencing?
   - `arcount`: How many extra records are we including?

### Our Implementation

The `DNS::Header` class handles all these details for you. Here's what it does:

1. **Initialization**
   - Creates a new header with sensible defaults
   - Sets up all the necessary fields with proper values

2. **Network Transmission**
   - Converts the header into the exact byte format that DNS servers expect
   - Uses Ruby's pack functionality to ensure correct binary formatting

---

## Español

### ¿Qué es un Header DNS?

El header DNS es la primera parte de cada mensaje DNS, ya sea una consulta (pidiendo información) o una respuesta (proporcionando información). Piensa en él como un sobre que contiene instrucciones importantes sobre el mensaje DNS que contiene.

### Estructura General

El header tiene 12 bytes de longitud y contiene varios campos que sirven diferentes propósitos:

1. **Identificación del Mensaje (ID)** - 16 bits
   - Un número único que permite emparejar consultas con sus respuestas
   - Como un número de seguimiento para tu mensaje DNS

2. **Flags de Control** - 16 bits en total
   - `qr`: ¿Es esto una pregunta (0) o una respuesta (1)?
   - `opcode`: ¿Qué tipo de consulta es? (Normalmente 0 para consulta estándar)
   - `aa`: ¿Es este servidor una autoridad para este dominio?
   - `tc`: ¿El mensaje era demasiado largo y tuvo que cortarse?
   - `rd`: ¿Debería el servidor buscar la respuesta completa?
   - `ra`: ¿Puede el servidor buscar respuestas?
   - `z`: Reservado para uso futuro
   - `rcode`: ¿Algo salió mal? ¿Qué tipo de error?

3. **Contadores de Sección** - 16 bits cada uno
   - `qdcount`: ¿Cuántas preguntas estamos haciendo?
   - `ancount`: ¿Cuántas respuestas estamos proporcionando?
   - `nscount`: ¿Cuántos servidores de nombres estamos referenciando?
   - `arcount`: ¿Cuántos registros extra estamos incluyendo?

### Nuestra Implementación

La clase `DNS::Header` maneja todos estos detalles por ti. Esto es lo que hace:

1. **Inicialización**
   - Crea un nuevo header con valores predeterminados sensatos
   - Configura todos los campos necesarios con valores apropiados

2. **Transmisión en Red**
   - Convierte el header al formato exacto de bytes que esperan los servidores DNS
   - Usa la funcionalidad pack de Ruby para asegurar el formato binario correcto
