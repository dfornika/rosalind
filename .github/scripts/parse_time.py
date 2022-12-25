#!/usr/bin/env python3

import argparse
import csv
import json
import sys


def main(args):
    output = {}

    float_fields = [
        "user_time_seconds",
        "system_time_seconds",
        "percent_of_cpu_this_job_got",
    ]

    int_fields = [
        "average_shared_text_size_kbytes",
        "average_unshared_text_size_kbytes",
        "average_stack_size_kbytes",
        "average_total_size_kbytes",
        "maximum_resident_set_size_kbytes",
        "average_resident_set_size_kbytes",
        "average_unshared_data_size_kbytes",
        "major_requiring_io_page_faults",
        "minor_reclaiming_a_frame_page_faults",
        "voluntary_context_switches",
        "involuntary_context_switches",
        "swaps",
        "file_system_inputs",
        "file_system_outputs",
        "socket_messages_sent",
        "socket_messages_received",
        "signals_delivered",
        "page_size_bytes",
        "exit_status",
    ]

    for line in sys.stdin:
        if line.strip().startswith('Elapsed'):
            field = '_'.join(line.strip().split(':')[0].split(' ')[:-1])
            value = ':'.join(line.strip().split(':')[-2:])
        else:
            field, value = line.strip().split(':', 1)
        field = field.lower().replace(' ', '_').replace('(', '').replace(')', '').replace('/', '').replace('"', '')
        value = value.strip().replace('"', '')
        if field.startswith('percent'):
            value = value.replace('%', '')
        for f in float_fields:
            if field == f:
                value = float(value)
        for f in int_fields:
            if field == f:
                value = int(value)
        output[field] = value

    output_fieldnames = [
        "command_being_timed",
        "elapsed_wall_clock_time",
    ] + float_fields + int_fields
    writer = csv.DictWriter(sys.stdout, fieldnames=output_fieldnames, dialect='unix', quoting=csv.QUOTE_MINIMAL)
    writer.writeheader()
    writer.writerow(output)

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    args = parser.parse_args()
    main(args)
