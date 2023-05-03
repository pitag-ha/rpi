#include <caml/mlvalues.h>

void uart_write_byte_blocking_actual(unsigned char);

value caml_write_byte(value chr)
{
    char chr2 = Int_val(chr);
    uart_write_byte_blocking_actual(chr2);
    return Val_unit;
}

void uart_set_baudrate(unsigned int);

value caml_set_baudrate(value r)
{
    unsigned int rate = Int_val(r);
    uart_set_baudrate(rate);
    return Val_unit;
}
