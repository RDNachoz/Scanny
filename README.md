# Scanny
The scanniest plugin for Jenkins in the wild west

## Purpose:
Scan source checked into github for vulnerabilities during Jenkins builds.

## Proposed Workflow
1. Code gets checked into Github causing Jenkins to pull
2. Jenkins checks code using plugin
3. Record vulnerabilities
4. Fix 'easy' vulnerabilities
5. If code is safe, complete build- else fail.
