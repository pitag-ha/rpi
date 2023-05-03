(* module Pwm = Rpi.Pwm.Make (struct
     let mode = Rpi.Pwm.Analog
     let pins = [Rpi.Pwm.Pin40; Rpi.Pwm.Pin41]
     let freq =  54 * 1000000 / 2
     let range = 0x264
     let is_stereo = true
   end) *)

(* module UART = Rpi.UART.UART0 *)

external write_byte : char -> unit = "caml_write_byte"
(* external uart_init : unit -> unit = "ocaml_init" *)

external set_baudrate : int -> unit = "caml_set_baudrate"

let () =
  (* print_endline "before dumping some random int to the UART"; *)
  (* UART.init (); *)
  Rpi.Mtime.sleep_us 10000000L;
  set_baudrate 31250;
  let rec loop () =
    (* write_byte (Char.unsafe_chr 33); *)
    (* print_string "\144\060\090";
    flush_all (); *)
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 60);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 60);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 64);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 64);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 67);
    write_byte (Char.unsafe_chr 0b01111111);
        (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 67);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 71);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 71);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 69);
    write_byte (Char.unsafe_chr 0b01111111);
        (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 69);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 67);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 67);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 64);
    write_byte (Char.unsafe_chr 0b01111111);
        (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 64);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 60);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 60);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 62);
    write_byte (Char.unsafe_chr 0b01111111);
        (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 62);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 65);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 65);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 69);
    write_byte (Char.unsafe_chr 0b01111111);
        (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 69);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 72);
    write_byte (Char.unsafe_chr 0b01111111);
    (* print_endline "foo"; *)
    Rpi.Mtime.sleep_us 250000L;
    write_byte (Char.unsafe_chr 0b10000000);
    write_byte (Char.unsafe_chr 72);
    write_byte (Char.unsafe_chr 0b01111111);
    write_byte (Char.unsafe_chr 0b10010000);
    write_byte (Char.unsafe_chr 71);
    write_byte (Char.unsafe_chr 0b01111111);
    Rpi.Mtime.sleep_us 1000000L;
    loop ()
  in
  loop ()
(* print_endline "";
   write_byte 2;
   print_endline "";
   write_byte 3;
   print_endline "";
   write_byte 4;
   print_endline "";
   write_byte 5;
   print_endline "";
   write_byte 6;
   print_endline "";
   write_byte 7;
   print_endline "";
   write_byte 8;
   print_endline "";
   write_byte 9;
   print_endline "";
   write_byte 10;
   print_endline "";
   write_byte 11;
   print_endline "";
   write_byte 12;
   print_endline "";
   write_byte 13;
   print_endline "";
   write_byte 14;
   print_endline "";
   write_byte 15;
   print_endline "";
   write_byte 16;
   print_endline "";
   write_byte 17;
   print_endline "";
   write_byte 18;
   print_endline "";
   write_byte 33; *)
(* UART.flushrx (); *)
(* print_endline "after dumping some random int to the UART" *)
