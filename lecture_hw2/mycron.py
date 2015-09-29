#!/usr/bin/python
import time
import datetime
import heapq
import subprocess

def log(msg):
    log_file = open('/var/mycron.log', 'a')
    # log_file = open('./tests/mycron.log', 'a')
    log_file.write('[' + time.strftime("%H:%M:%S") + ']: ')
    log_file.write(msg + '\n')
    log_file.close()


def process():
    tasks_file = open('/etc/mycron.cfg', 'r')
    # tasks_file = open('./tests/mycron.cfg', 'r')
    tasks = list()
    start_time = datetime.datetime.utcnow()
    while True:
        time_str = tasks_file.readline()
        if time_str == '':
            break
        t = int(time_str)
        command = tasks_file.readline()
        tasks.append((start_time + datetime.timedelta(minutes=t), (t, command)))
        format_msg = 'Successful parse command "{0}". With interval = {1}'
        log(format_msg.format(command, t))

    tasks_file.close()
    heapq.heapify(tasks)
    
    while True:
        while tasks[0][0] < datetime.datetime.utcnow():
            nearest = heapq.heappop(tasks)
            command = nearest[1][1]
            t = nearest[1][0]
            log('Execute: {0}'.format(command))
            subprocess.Popen(command.split())
            next_time = datetime.datetime.utcnow() + datetime.timedelta(minutes=t)
            heapq.heappush(tasks, (next_time, nearest[1]))

        time.sleep(1)

try:
    process()
except Exception as e:
    log('Error happend: {0}'.format(e))