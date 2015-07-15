#!/usr/bin/env bats

@test "no java binary in /usr/bin" {
  run ls /usr/bin/java
  [ "$status" -ne 0 ]
}
