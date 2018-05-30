from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse

import tensorflow as tf

def main(*args, **kwargs):
    """Main function.

    This function orchestates the process of loading data,
    initializing the model, training the model, and evaluating the
    result.
    """
    args = parse_args()
    data = init_data(args)
    model = init_model(data, args)
    train(model, data, args)
    evaluate(model, data, args)
    export(model, args)


def parse_args():
    """Parse command line arguments.

    TODO: Modify the list of arguments below as needed for your
    model. Consider exposing model hyperparameters here rather than
    hard-code them in the model defintion. This lets users experiment
    with different values without modifying the source.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('--batch_size', default=1, type=int)
    parser.add_argument('--data_dir', default='./input/training')
    parser.add_argument('--model_dir', default='./checkpoint')
    parser.add_argument('--train_epochs', default=1, type=int)
    parser.add_argument('--epochs_between_evals', default=1, type=int)
    parser.add_argument('--export_dir', default='./pipeline_tfserving')

    return parser.parse_args()


def init_data(args):
    """Initialize data for training and evaluation.

    TODO: Modify this function to load and initialize your training
    and test data. The value returned by this function is passed to
    the `train` and `evaluate` functions. As a convention consider
    returning a tuple of `(train_x, train_y), (test_x, test_y)` if
    that meets your needs.
    """
    train_x, train_y = [], []
    test_x, test_y = [], []
    return (train_x, train_y), (test_x, test_y)


def init_model(data, args):
    """Initialize the model for training and evaluation.

    TODO: Modify this function to initialize your model. The value
    returned by this function will be passed to the `train` and
    `evaluate` functions. Consider using `args`, which is returned by
    `parse_args`, for model hyperparameters rather than hard-coding
    values here. If the model is configured to write logs or other
    files, consider using `args.model_dir` as a the location for those
    files.
    """
    return 'sample model'


def train(model, data, args):
    """Train the model.

    TODO: Modify this function to train the model. This may be to call
    a single method on `model`, as would be the case for tf.Estimator
    or Keras based models, or an explicit training loop as shown
    below.
    """
    print('Sample train.')


def evaluate(model, data, args):
    """Evaluate the trained model.

    TODO: Modify this function to evaluate the model using test data.
    """
    print('Sample evaluate: XX % accuracy')


def export(model, args):
    """Export the model.

    TODO: Modify this function to export (preferably TF SavedModel format)
    """
    print('Export model')


if __name__ == '__main__':
    tf.logging.set_verbosity(tf.logging.INFO)
    tf.app.run(main=main, argv=[sys.argv[0]])
