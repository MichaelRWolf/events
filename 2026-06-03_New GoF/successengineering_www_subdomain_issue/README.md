# successengineering.works www Subdomain Configuration Issue

Self-contained project directory for documenting and testing the www subdomain misconfiguration on successengineering.works.

## Files

- **`www_subdomain_configuration_issue.md`** — Full problem description, root cause analysis, and solution recommendations
- **`test_www_not_secure.py`** — Single-file test (TAP format) to verify the misconfiguration. Run with: `python3 test_www_not_secure.py`
- **`EMAIL_TO_AL.txt`** — Email template to send to Al with brief explanation and test instructions

## Quick Start

```bash
cd successengineering_www_subdomain_issue
pip3 install requests
python3 test_www_not_secure.py
```

Expected output when issue exists: **4 tests failed, 8 passed**

## To Send to Al

Send these two files:
1. `www_subdomain_configuration_issue.md` — explains the problem and solution
2. `test_www_not_secure.py` — proves the problem exists

Use the text from `EMAIL_TO_AL.txt` as the email message.

---

**Created:** 2026-07-02
**Related:** NewGoF Roundtable event (2026-07-01)
**Status:** Issue documented, test suite created, email template ready
