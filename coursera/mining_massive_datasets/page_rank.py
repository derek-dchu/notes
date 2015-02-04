"""
Compute page rank
"""


import numpy as np
from numpy import linalg as LA


def calculator(beta, theta=0.001):
    """
    Page rank calculator generator for different beta, 
    theta.

    :param beta: a float
    :param theta: a float

    :return: page rank calculation function
    """
    # Create Google matrix
    def g_matrix(page_links):
        """
        Generate Google matrix

        :param page_links: object contains all pages
                           and there adjacency list.

        :return: numpy matrix
        """
        n = len(page_links)
        m = np.zeros((n, n))

        for page, links in page_links.items():
            # fix dead end
            if links == []:
                m[:, page] = 1.0 / n

            else:
                d = len(links)
                for link in links:
                    m[link, page] = 1.0 / d

        return beta * m + (1 - beta) * (1.0 / n) * np.ones((n, n))

    # Calculate page rank
    def page_rank(page_links, init_r=None):
        n = len(page_links)

        if init_r is None:
            old_r = np.matrix([1.0 / n for i in range(0, n)]).T
            S = 1
        else:
            old_r = np.matrix(init_r).T
            S = sum(init_r)
        m = g_matrix(page_links)

        t = 1
        next_r = m * old_r
        while LA.norm(next_r - old_r) > theta:
            old_r = next_r + (S - next_r.sum()) / n
            next_r = m * old_r
            t += 1

        return next_r

    return page_rank


if __name__ == '__main__':
    def simple_assert(f1, f2):
        return abs(f1 - f2) <= 0.01

    # Question 1
    print 'Q1: '
    page_links = {
        0: [1, 2],
        1: [2],
        2: [2]
    }

    page_rank = calculator(0.7)
    ranks = page_rank(page_links) * 3

    a = ranks[0, 0]; b = ranks[1, 0]; c = ranks[2, 0]
    print simple_assert(a + c, 2.595)
    print simple_assert(a + c, 2.035)
    print simple_assert(b + c, 2.735)
    print simple_assert(a + b, 0.655)

    # Question 2
    print 'Q2: '
    page_links = {
        0: [1, 2],
        1: [2],
        2: [0]
    }

    page_rank = calculator(0.85)
    ranks = page_rank(page_links)

    a = ranks[0, 0]; b = ranks[1, 0]; c = ranks[2, 0]
    print simple_assert(85 * b, 0.575 * a + 0.15 * c)
    print simple_assert(a, 0.9 * c + 0.05 * b)
    print simple_assert(a, c + 0.15 * b)
    print simple_assert(0.95 * b, 0.475 * a + 0.05 * c)
    print simple_assert(0.85 * a, c + 0.15 * b)
    print simple_assert(0.95 * a, 0.9 * c + 0.05 * b)

    # Question 3
    print 'Q3: '
    page_links = {
        0: [1, 2],
        1: [2],
        2: [0]
    }

    page_rank = calculator(1)
    init_r = [1, 1, 1]
    ranks = page_rank(page_links, init_r)

    print ranks





