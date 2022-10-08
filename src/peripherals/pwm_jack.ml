let base = Rpi_hardware.pwm1

module Reg = struct
  module Ctl = struct
    include Register.Make (struct
      let addr = base
    end)

    let msen1 = bool ~offset:7
    let clrf = bool ~offset:6
    let usef1 = bool ~offset:5
    let usef2 = bool ~offset:13
    let mode1 = bool ~offset:1
    let pwen1 = bool ~offset:0
    let pwen2 = bool ~offset:8
    let clrf = bool ~offset:6
  end

  module Sta = struct
    include Register.Make (struct
      let addr = Mem.(base + 0x04n)
    end)

    let empt1 = bool ~offset:1
    let full1 = bool ~offset:0
    let gapo0 = bool ~offset:5
  end

  let rng1 = Mem.(base + 0x10n)
  let rng2 = Mem.(base + 0x20n)
  let fif1 = Mem.(base + 0x18n)
end

let flush () =
  while not Reg.Sta.(read empt1) do
    ()
  done

let stop () =
  Reg.Ctl.(empty |> set clrf true |> write);
  print_endline "here";
  flush ();
  print_endline "there";
  Reg.Ctl.(write empty)

let init () =
  Mem.dmb ();

  (* ? -> GPIO *)
  (* Gpio.(set_pull_state P40 PULL_DOWN);
     Gpio.(set_pull_state P41 PULL_DOWN);
     print_endline "3"; *)
  Gpio.(set_func P40 F_ALT0);
  Gpio.(set_func P41 F_ALT0);

  Mem.dmb ();

  (* PWM -> CLOCK *)
  Mtime.sleep_us 10L;

  Clock.kill ();

  Mtime.sleep_us 10L;

  Clock.set_pwm_clock (54 * 1000000 / 2);

  Mem.dmb ();

  (* GPIO -> PWM *)
  Mem.dmb ();

  (* CLOCK -> PWM *)
  stop ();
  Mtime.sleep_us 2000L;
  Mem.set_int Reg.rng1 0x264;
  Mem.set_int Reg.rng2 0x264;

  Reg.Ctl.(
    empty |> set usef1 true |> set pwen1 true |> set usef2 true
    |> set pwen2 true |> set clrf true |> write);

(*
     Mem.set_int Reg.rng1 32;
   Reg.Ctl.(empty |> set clrf true |> write);
   Mtime.sleep_us 10L;
   Reg.Ctl.(empty |> set msen1 true |> set usef1 true |> set mode1 true |> write);
   Mtime.sleep_us 10L;
   Reg.Ctl.(
     empty |> set msen1 true |> set usef1 true |> set mode1 true
     |> set pwen1 true |> write) *)

(* let handle_error () =
   let err_mask = empty |> (*FIXME*)
   if Reg.Sta.(read err_mask)

    then Reg.Sta.(write err_mask) else () *)
(*
let write int_val =
  let* bytes =
    Music.get
    (* something*)
    (*filename*)
  in
  match bytes with
  | Error err -> failwith "couldn't read music file"
  | Ok bytes ->
      while Reg.Sta.(read full1) do
        ()
      done;
      Mem.set_int fif1 int_val *)

let write int_val =
  (* TODO: check bound *)
  while Reg.Sta.(read full1) do
    ()
  done;
  Mem.set_int Reg.fif1 int_val
