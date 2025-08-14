#include "colormodel.h"

ColorModel::ColorModel(QObject *parent)
    : QAbstractListModel(parent) {
    m_list = QColor::colorNames();
}

int ColorModel::rowCount(const QModelIndex &parent) const
{
    if (parent.isValid())
        return 0;
    return m_list.size();
}

QVariant ColorModel::data(const QModelIndex &index, int role) const
{
    if (!checkIndex(index, CheckIndexOption::IndexIsValid))
        return QVariant();

    if (!index.isValid())
        return QVariant();

    int row = index.row();
    const QString result = m_list[row];

    switch (role) {
    case Qt::DisplayRole:
        return result;
    }

    return QVariant();
}

QHash<int, QByteArray> ColorModel::roleNames() const
{
    QHash<int, QByteArray> mapping {
        {Qt::DisplayRole, "valueText"}
    };
    return mapping;
}
