include Peripheral.S

module type S = sig
  val set_pwm_clock : int -> unit

  val kill : unit -> unit
end

module Make (_ : Base) (_ : Mtime.S) : S
