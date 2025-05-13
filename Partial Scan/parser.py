import re
import pandas as pd

def parse_scoap_to_excel(input_file, output_excel):
    """
    Parses a SCOAP file and outputs an Excel sheet with FlipFlop name, D input CC0, CC1, and Q output CO.
    """
    with open(input_file, 'r') as file:
        scoap_data = file.read()

    # Regular expression to match flip-flop name and their SCOAP values for D and Q
    dff_pattern = re.compile(r'(\w+)\s*\(\d+\)\s*DFF.*?!.*?\n.*?CLK.*?\n.*?\((\d+)-(\d+)-(\d+)\).*?\n.*?\((\d+)-(\d+)-(\d+)\)', re.DOTALL)

    matches = dff_pattern.findall(scoap_data)

    dff_records = []

    for match in matches:
        flip_flop = match[0]
        d_cc0 = int(match[1])
        d_cc1 = int(match[2])
        d_co = int(match[3])
        q_cc0 = int(match[4])
        q_cc1 = int(match[5])
        q_co = int(match[6])

        dff_records.append({
            'FlipFlop': flip_flop,
            'D_CC0': d_cc0,
            'D_CC1': d_cc1,
            'Q_CO': q_co
        })

    # Create DataFrame
    df = pd.DataFrame(dff_records)

    # Save to Excel
    df.to_excel(output_excel, index=False)

# Example usage:
parse_scoap_to_excel('scoap_data_dff.txt', 'parsed_scoap.xlsx')
