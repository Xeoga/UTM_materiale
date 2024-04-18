from datetime import datetime
import pytz

def get_time_by_timezone():
    # Solicităm utilizatorului să introducă zona geografică
    timezone_input = input("Introdu zona geografică (ex. 'GMT+3' sau 'GMT-5'): ")
    if timezone_input.startswith("GMT"):
        sign = timezone_input[3]
        offset = int(timezone_input[4:])
        timezone_name = f"Etc/GMT{'+' if sign == '-' else '-'}{offset}"  
    else:
        print("Formatul introdus este incorect.")
        return
    try:
        timezone = pytz.timezone(timezone_name)
    except pytz.UnknownTimeZoneError:
        print("Zona geografică specificată nu este validă.")
        return
    now = datetime.now(timezone)
    print(f"Ora exactă în zona '{timezone_input}' este {now.strftime('%Y-%m-%d %H:%M:%S')}")

get_time_by_timezone()
