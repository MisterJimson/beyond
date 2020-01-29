#!/usr/bin/env bash
flutter test --coverage
genhtml coverage/lcov.info --output-directory coverage/report