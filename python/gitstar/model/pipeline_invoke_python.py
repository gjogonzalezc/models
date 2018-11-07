import os
import json
import logging
import requests
import urllib

from pipeline_monitor import prometheus_monitor as monitor
from pipeline_logger import log

_logger = logging.getLogger('pipeline-logger')
_logger.setLevel(logging.INFO)
_logger_stream_handler = logging.StreamHandler()
_logger_stream_handler.setLevel(logging.INFO)
_logger.addHandler(_logger_stream_handler)

__all__ = ['invoke']


_labels = {
           'name': 'gitstar',
           'tag': 'v1',
           'runtime': 'python',
           'chip': 'cpu',
           'resource_type': 'model',
           'resource_subtype': 'python',
          }

@log(labels=_labels, logger=_logger)
def invoke(request):
    with monitor(labels=_labels, name="invoke"):

        request_str = request.decode('utf-8')
        avatar_url = json.loads(request_str)['sender']['avatar_url']

        cmd = 'curl -X POST --data-urlencode "payload={\\"unfurl_links\\": true, \\"channel\\": \\"#demo-community\\", \\"username\\": \\"pipelineai_bot\\", \\"text\\": \\"%s\\"}" https://hooks.slack.com/services/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' % avatar_url
        print(cmd)
        import subprocess
        response = subprocess.check_output(cmd, shell=True).decode('utf-8')

#        payload = {
#                   "unfurl_links": "true",
#                   "channel": "#demo-community",
#                   "username": "pipelineai_bot",
#                   "text": "%s" % avatar_url
#                  }

#        response = requests.post(
#                                 url='https://hooks.slack.com/services/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',
#                                 data=payload
#                                )
#        response = response.text

        return {'response': response}

if __name__ == '__main__':
    with open('./pipeline_test_request.json', 'rb') as fh:
        contents_binary = fh.read()
        response = invoke(contents_binary)
        print(response)
