
======================================
**spi** - serial peripheral interface
======================================

Module implements master serial peripheral interface. Supports simple internal loops.

**Unit test/Example:** 
`test_SimSpi.v <https://github.com/SiLab-Bonn/basil/blob/master/host/tests/test_SimSpi.v>`_ 
`test_SimSpi.py <https://github.com/SiLab-Bonn/basil/blob/master/host/tests/test_SimSpi.py>`_

Parameters
    +--------------+---------------------+-------------------------------------------------------------------------+ 
    | Name         | Default             | Description                                                             | 
    +==============+=====================+=========================================================================+ 
    | MEM_BYTES    | 16                  | Amount of meemory allocated for data (maximum single transfer in bytes) | 
    +--------------+---------------------+-------------------------------------------------------------------------+ 

Pins
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | Name         | Size                | Direction             | Description                                          | 
    +==============+=====================+=======================+======================================================+ 
    | SPI_CLK      | 1                   |  input                | clock used for SPI transfers                         | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | SCLK         | 1                   |  output               | external clock (active only during transfers)        | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | SDO          | 1                   |  input                | incoming data                                        | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | SDI          | 1                   |  output               | outgoing data                                        | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | SEN          | 1                   |  output               | active high during transfer                          | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | SLD          | 1                   |  output               | active high strobe indicating end of transfer        | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+ 
    | EXT_START    | 1                   |  input                | active high start signal (synchronous to SPI_CLK)    | 
    +--------------+---------------------+-----------------------+------------------------------------------------------+
  
Registers
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | Name         | Address                          | Bits   | r/w   | Default     | Description                                 | 
    +==============+==================================+========+=======+=============+=============================================+ 
    | START        | 1                                |        | wo    |             | start transfer on write to address          | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | DONE         | 1                                | [0]    | ro    | 0           | indicate transfer finish                    | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | BIT_OUT      | 4 - 3                            | [15:0] | r/w   | MEM_BYTES*8 | set the size of transfer in bits            | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | WAIT         | 8 - 5                            | [31:0] | r/w   | 0           | waits after every transfer if REPEAT != 0   | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | REPEAT       | 12 - 9                           | [31:0] | r/w   | 1           | repeat transfer count (0 -> forever)        | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | CONF_EN      | 13                               | [0]    | r/w   | 0           | enable external start (0-> soft start only) | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | MEM_BYTES    | 15 - 14                          | [15:0] | ro    | MEM_BYTES   | byte size of memory                         | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | DATA_OUT     | 16 to 16+MEM_BYTES-1             |        | r/w   | unknown     | memory for outgoing data                    | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
    | DATA_IN      | 16+MEM_BYTES to 16+2*MEM_BYTES-1 |        | r/w   | unknown     | memory for incoming data                    | 
    +--------------+----------------------------------+--------+-------+-------------+---------------------------------------------+ 
