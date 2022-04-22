#!/bin/nu

def main [
  name?: string
  --test (-t): string
]  {
  echo $name
  echo $test
}

